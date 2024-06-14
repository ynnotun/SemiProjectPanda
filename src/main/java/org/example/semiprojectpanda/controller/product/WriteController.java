package org.example.semiprojectpanda.controller.product;

import org.example.semiprojectpanda.service.ProductWriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WriteController {
    //콩비 추가 : 24/06/13_12:10 version.1
    // /product/write

    //@Autowired
    private ProductWriteService productWriteService;

    /*
    private String bucketName = "";
    private String folderName = "";

    @Autowired
    private NcpObjectStorageService storageService;
    */

    @GetMapping("/product/write")
    public String productWrite() {
        return "product/product-write";
    }
}
