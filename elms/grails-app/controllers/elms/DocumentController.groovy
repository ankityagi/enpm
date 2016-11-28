package elms



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def uploadfile(file,params) {
        if(file.empty) {
            flash.message = "File cannot be empty"
        } else {
            def documentInstance = new Document()
            documentInstance.filename = file.originalFilename
            def storagePathDirectory = new File(grailsApplication.config.uploadFolder +  File.separator + params.type + File.separator + params.id)
            //println storagePathDirectory
            if (!storagePathDirectory.exists()) {
                if (storagePathDirectory.mkdirs()) {
                    println "SUCCESS"
                } else {
                    println "FAILED"
                }
            }
            documentInstance.fullPath = grailsApplication.config.uploadFolder + documentInstance.filename
            
            file.transferTo(new File(documentInstance.fullPath))
            documentInstance.save() 
        }
        redirect (contoller: params.type, action: "show", id: params.id)
    }

    def deleteDocs() {
            Document documentInstance = Document.get(Eval.me(params.id))
            def pathToFile = grailsApplication.config.grails.app.uploadDir.replaceAll("/upload","") + documentInstance.fullPath
            def file = new File(pathToFile)
            boolean fileSuccessfullyDeleted =  file.delete()
            if (fileSuccessfullyDeleted) {
                documentInstance.delete flush:true
                flash.message = "Document has been deleted"
                render true
            }
            // redirect (action: 'attachDocs', id: params.workspaceId)
        }

    def download(long id) {
        Document documentInstance = Document.get(id)
        print id
        if ( documentInstance == null) {
            flash.message = "Document not found."
            redirect (action:'list')
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${documentInstance.filename}\"")
            
            def file = new File(grailsApplication.config.uploadFolder.replaceAll("/uploads","") + documentInstance.fullPath)
            
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()
        }
    }
}
