package com.marcschwieterman.todo;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

import java.net.URI;

import javax.ws.rs.core.UriBuilder;

import org.junit.Test;

public class TodoResourceIT {

    private static String DEFAULT_HOST = System.getProperty("gae.host", "localhost");
    private static int DEFAULT_PORT = Integer.valueOf(System.getProperty("gae.port", "8080"));

    private static URI getBaseURI(String host, int port) {
        return UriBuilder.fromUri("http://" + host + "/").port(port).build();
    }

    public static final URI BASE_URI = getBaseURI(DEFAULT_HOST, DEFAULT_PORT);

    @Test
    public void testList() {
        TodoClient client = new TodoClient(BASE_URI);
        client.reset();
        assertThat(client.list().size(), is(0));

        client.create(new Todo("task 1"));
        client.create(new Todo("task 2"));
        client.create(new Todo("task 3"));

        assertThat(client.list().size(), is(3));
    }

    @Test
    public void testShow() {
        TodoClient client = new TodoClient(BASE_URI);
        client.reset();
        Todo todo = client.create(new Todo("i am"));

        assertThat(client.show(todo.getId()), notNullValue());
    }

    @Test
    public void testUpdate() {
        TodoClient client = new TodoClient(BASE_URI);
        client.reset();
        Todo todo = client.create(new Todo("todone"));

        todo.setStatus(Status.DONE);
        todo = client.update(todo);

        assertThat(todo.getStatus(), is(Status.DONE));
    }

    @Test
    public void testDelete() {
        TodoClient client = new TodoClient(BASE_URI);
        client.reset();
        Todo todo = client.create(new Todo("delete me"));

        client.delete(todo.getId());

        assertThat(client.show(todo.getId()), nullValue());
    }

}
