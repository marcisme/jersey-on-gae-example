package com.marcschwieterman.todo;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.GenericType;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;

import java.net.URI;
import java.util.List;

public class TodoClient {

    private static final String PATH = "todo";

    private WebResource resource;

    public TodoClient(URI baseUri) {
        ClientConfig cc = new DefaultClientConfig();
        Client client = Client.create(cc);
        resource = client.resource(baseUri);
    }

    public List<Todo> list() {
        return resource.path(PATH).get(new GenericType<List<Todo>>() {
        });
    }

    public Todo show(Long id) {
        ClientResponse response = resource.path(PATH).path(id.toString()).get(ClientResponse.class);
        if (response.getStatus() == 200) {
            return response.getEntity(Todo.class);
        }
        return null;
    }

    public Todo create(Todo todo) {
        return resource.path(PATH).post(Todo.class, todo);
    }

    public Todo update(Todo todo) {
        return resource.path(PATH).put(Todo.class, todo);
    }

    public void delete(Long id) {
        resource.path(PATH).path(id.toString()).delete();
    }

    public void reset() {
        resource.path(PATH).delete();
    }

}
