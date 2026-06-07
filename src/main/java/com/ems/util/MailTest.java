package com.ems.util;

public class MailTest {

    public static void main(String[] args) {

        EmailUtil.sendEmail(

                "satyamthakur789456123@gmail.com",

                "Employee Management System Test",

                "Congratulations! Your JavaMail setup is working."
        );
    }
}