package com.Beam.controller;

import com.Beam.po.uploadImages;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/file")
public class UploadFilesController {
    @Resource
    com.Beam.biz.uploadFilesService uploadFilesService;


    //    图片上传
    @RequestMapping("/uploadImages")
    public String uploadImages(uploadImages images, HttpServletRequest request, Model model) throws Exception{

        String sqlPath;
        String localPath = "C:\\YanYuanOrderImages\\uploadFiles";

        String imageName = request.getParameter("imgName");
        String imageRemark = request.getParameter("imgRemark");

        if (imageName.isEmpty()) {

//            生成uuid作为文件名称
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
//            获得文件类型
            String contentType = images.getFile().getContentType();
//            获得文件后缀名
            String suffixName = contentType.substring(contentType.indexOf("/") + 1);
//            得到文件名
            imageName = uuid + "." + suffixName;
//            文件保存路径
            images.getFile().transferTo(new File(localPath + imageName));

        }else{
//            获得文件类型
            String contentType = images.getFile().getContentType();
//            获得文件后缀名
            String suffixName = contentType.substring(contentType.indexOf("/") + 1);
//            得到文件名
            imageName = imageName + "." + suffixName;
//            文件保存路径
            images.getFile().transferTo(new File(localPath + imageName));
        }
//        把图片的相对路径保存到数据库
        sqlPath = "/images/"+imageName;
        images.setPath(sqlPath);
        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("imageName", imageName);
        paramsMap.put("imagePath", sqlPath);
        paramsMap.put("imageRemark", imageRemark);

        uploadFilesService.insertImages(paramsMap);

//        回显
        model.addAttribute("imageName", imageName);
        model.addAttribute("imagePath", sqlPath);
        model.addAttribute("iamgePath", imageRemark);

        return "uploadBack";

    }

}
