package org.example.semiprojectpanda;

import io.github.cdimascio.dotenv.Dotenv;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SemiProjectPandaApplication {


    public static void main(String[] args) {
        Dotenv dotenv = Dotenv.load();

        System.setProperty("DB_USERNAME", dotenv.get("DB_USERNAME"));
        System.setProperty("DB_PASSWORD", dotenv.get("DB_PASSWORD"));
        System.setProperty("DB_URL", dotenv.get("DB_URL"));

        System.setProperty("MINIO_ACCESS_KEY", dotenv.get("MINIO_ACCESS_KEY"));
        System.setProperty("MINIO_SECRET_KEY", dotenv.get("MINIO_SECRET_KEY"));
        System.setProperty("MINIO_ENDPOINT", dotenv.get("MINIO_ENDPOINT"));

        System.setProperty("MAIL_PASSWORD", dotenv.get("MAIL_PASSWORD"));

        System.setProperty("HOST_URL", dotenv.get("HOST_URL"));


        SpringApplication.run(SemiProjectPandaApplication.class, args);
    }

}
