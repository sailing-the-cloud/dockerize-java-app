package com.example.restcrudspring.exceptionhandle;

public class StudentNotFoundException extends RuntimeException {
    public StudentNotFoundException(String exception) {
        super(exception);
    }
}
