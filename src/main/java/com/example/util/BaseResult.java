package com.example.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Objects;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BaseResult<E> {
    private boolean status = true;
    private String errMsg = "OK";
    private E data;
}
