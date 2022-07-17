package com.apress.batch.chapter10;

import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.SpringApplication;

@SpringBootApplication
public class Chapter10Application {

	public static void main(String[] args) {
		String[] realArgs = {
            "customerUpdateFile=file:///vagrant/code/Chapter10/src/main/resources/data/customer_update_shuffled.csv",
		    "transactionFile=file:///vagrant/code/Chapter10/src/main/resources/data/transactions.xml",
		    "outputDirectory=file:///vagrant/code/Chapter10/outputDir/statement"
        };
		SpringApplication.run(Chapter10Application.class, realArgs);
	}
}
