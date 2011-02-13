package com.marcschwieterman.todo;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import com.marcschwieterman.todo.Status;
import javax.persistence.Enumerated;
import javax.xml.bind.annotation.XmlRootElement;

@RooJavaBean
@RooToString
@RooEntity
@XmlRootElement
public class Todo {

    @Enumerated
    private Status status = Status.CREATED;

    private String description;

    public Todo() {
    }
    
	public Todo(String description) {
		this.description = description;
	}
    
}
