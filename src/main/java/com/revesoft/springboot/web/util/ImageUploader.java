package com.revesoft.springboot.web.util;


import org.apache.catalina.core.ApplicationContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.multipart.MultipartFile;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletContext;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.IOException;

@Service

public class ImageUploader {

    @Autowired
    ServletContext context;

;

    public String fileChecker(MultipartFile file) {

        File file1 = new File(file.getOriginalFilename());
        String filename = file.getOriginalFilename();
//        try {
//            file.transferTo(file1);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        //String mimeType = new MimetypesFileTypeMap().getContentType(file1);
        String mimeType = "";

        if (context.getMimeType(filename) == null) {
            return "invalid";
        } else {
            mimeType = context.getMimeType(filename);
            String[] fileType = mimeType.split("/");
            return fileType[0];
        }


    }

    public String upload(MultipartFile file, String uploadFolder, String fileName) {
        String filepath = "";

        String Name = file.getOriginalFilename();
//        uploadFolder=uploadFolder.replaceAll("\\\\", File.separator);
        char [] uploadFolderCharacterArray = uploadFolder.toCharArray();
        for(int i=0;i<uploadFolderCharacterArray.length;i++){
            if(uploadFolderCharacterArray[i] == '\\'){
                uploadFolderCharacterArray[i] = '/';
            }
        }
        uploadFolder = String.valueOf(uploadFolderCharacterArray);
        uploadFolder = uploadFolder.replaceAll("\\b/webapp\\b","");

        String ext = ".png";
        if(file.getContentType().equals("image/png"))ext = ".png";
        else if (file.getContentType().equals("image/jpeg"))ext = ".jpg";
        String checker = "";
        if(!Name.equals("blob")) {
            checker = fileChecker(file);
            if (checker.equals("invalid")) {
                return "invalid";
            }
            if (!checker.equals("image")) {
                return "invalid";
            }
        }

        if (file.isEmpty()) {
            return "invalid";
        } else {

            try {

                File file1 = new File(uploadFolder);
                System.out.println(file1.getAbsoluteFile()+"\n"+uploadFolder);
                try {
                    if (!file1.exists()) {
                        file1.mkdirs();
                    }
                }catch (Exception e){
                    System.out.println(file1.getAbsoluteFile());
                    e.printStackTrace();
                }


                // Get the file and save it somewhere
                byte[] bytes = file.getBytes();
                Path path = Paths.get(uploadFolder + fileName + ext);

                Files.write(path, bytes);
                filepath = fileName + ext;

            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return filepath;
        //return PathBuilder.profilePicPath;

    }
    public String profileImageupload(MultipartFile file, String uploadFolder, String fileName) {
        String filepath = "";

        String Name = file.getOriginalFilename();
        String ext = ".png";
        if(file.getContentType().equals("image/png"))ext = ".png";
        else if (file.getContentType().equals("image/jpeg"))ext = ".jpg";
        String checker = "";
        if(!Name.equals("blob")) {
            checker = fileChecker(file);
            if (checker.equals("invalid")) {
                return "invalid";
            }
            if (!checker.equals("image")) {
                return "invalid";
            }
        }

        if (file.isEmpty()) {
            return "invalid";
        } else {

            try {

                byte[] bytes = file.getBytes();
                Path path = Paths.get( uploadFolder+ fileName + ext);

                Files.write(path, bytes);
                filepath =fileName + ext;

            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return filepath;
        //return PathBuilder.profilePicPath;

    }
}
