// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.marcschwieterman.todo;

import com.marcschwieterman.todo.Status;
import java.lang.String;

privileged aspect Todo_Roo_JavaBean {
    
    public Status Todo.getStatus() {
        return this.status;
    }
    
    public void Todo.setStatus(Status status) {
        this.status = status;
    }
    
    public String Todo.getDescription() {
        return this.description;
    }
    
    public void Todo.setDescription(String description) {
        this.description = description;
    }
    
}