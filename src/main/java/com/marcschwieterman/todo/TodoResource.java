package com.marcschwieterman.todo;

import org.springframework.stereotype.Service;

import javax.ws.rs.*;
import java.util.List;

@Service
@Consumes({"application/xml", "application/json"})
@Produces({"application/xml", "application/json"})
@Path("todo")
public class TodoResource {
	
	@GET
	public List<Todo> list() {
        return Todo.findAllTodoes();
	}
	
	@GET
	@Path("{id}")
	public Todo show(@PathParam("id") Long id) {
        return Todo.findTodo(id);
	}
	
	@POST
	public Todo create(Todo todo) {
		todo.persist();
        return todo;
	}

	@PUT
	public Todo update(Todo todo) {
        return todo.merge();
	}
	
	@DELETE
	@Path("{id}")
	public void delete(@PathParam("id") Long id) {
		Todo.findTodo(id).remove();
	}
	
	@DELETE
	public void reset() {
		for(Todo todo : Todo.findAllTodoes()) {
			todo.remove();
		}
	}
	
}
