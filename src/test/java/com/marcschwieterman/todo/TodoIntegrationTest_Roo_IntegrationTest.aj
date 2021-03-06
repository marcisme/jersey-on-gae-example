// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.marcschwieterman.todo;

import com.google.appengine.tools.development.testing.LocalServiceTestHelper;
import com.marcschwieterman.todo.TodoDataOnDemand;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TodoIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TodoIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TodoIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: TodoIntegrationTest: @Transactional;
    
    @Autowired
    private TodoDataOnDemand TodoIntegrationTest.dod;
    
    private static final LocalServiceTestHelper TodoIntegrationTest.helper = new LocalServiceTestHelper(new com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig());
    
    @BeforeClass
    public static void TodoIntegrationTest.setUp() {
        helper.setUp();
    }
    
    @AfterClass
    public static void TodoIntegrationTest.tearDown() {
        helper.tearDown();
    }
    
    @Test
    public void TodoIntegrationTest.testCountTodoes() {
        org.junit.Assert.assertNotNull("Data on demand for 'Todo' failed to initialize correctly", dod.getRandomTodo());
        long count = com.marcschwieterman.todo.Todo.countTodoes();
        org.junit.Assert.assertTrue("Counter for 'Todo' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TodoIntegrationTest.testFindTodo() {
        com.marcschwieterman.todo.Todo obj = dod.getRandomTodo();
        org.junit.Assert.assertNotNull("Data on demand for 'Todo' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Todo' failed to provide an identifier", id);
        obj = com.marcschwieterman.todo.Todo.findTodo(id);
        org.junit.Assert.assertNotNull("Find method for 'Todo' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Todo' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TodoIntegrationTest.testFindAllTodoes() {
        org.junit.Assert.assertNotNull("Data on demand for 'Todo' failed to initialize correctly", dod.getRandomTodo());
        long count = com.marcschwieterman.todo.Todo.countTodoes();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Todo', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.marcschwieterman.todo.Todo> result = com.marcschwieterman.todo.Todo.findAllTodoes();
        org.junit.Assert.assertNotNull("Find all method for 'Todo' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Todo' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TodoIntegrationTest.testFindTodoEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Todo' failed to initialize correctly", dod.getRandomTodo());
        long count = com.marcschwieterman.todo.Todo.countTodoes();
        if (count > 20) count = 20;
        java.util.List<com.marcschwieterman.todo.Todo> result = com.marcschwieterman.todo.Todo.findTodoEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Todo' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Todo' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TodoIntegrationTest.testFlush() {
        com.marcschwieterman.todo.Todo obj = dod.getRandomTodo();
        org.junit.Assert.assertNotNull("Data on demand for 'Todo' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Todo' failed to provide an identifier", id);
        obj = com.marcschwieterman.todo.Todo.findTodo(id);
        org.junit.Assert.assertNotNull("Find method for 'Todo' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTodo(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Todo' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TodoIntegrationTest.testMerge() {
        com.marcschwieterman.todo.Todo obj = dod.getRandomTodo();
        org.junit.Assert.assertNotNull("Data on demand for 'Todo' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Todo' failed to provide an identifier", id);
        obj = com.marcschwieterman.todo.Todo.findTodo(id);
        boolean modified =  dod.modifyTodo(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        com.marcschwieterman.todo.Todo merged = (com.marcschwieterman.todo.Todo) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Todo' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TodoIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Todo' failed to initialize correctly", dod.getRandomTodo());
        com.marcschwieterman.todo.Todo obj = dod.getNewTransientTodo(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Todo' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Todo' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Todo' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional(propagation = Propagation.SUPPORTS)
    public void TodoIntegrationTest.testRemove() {
        com.marcschwieterman.todo.Todo obj = dod.getRandomTodo();
        org.junit.Assert.assertNotNull("Data on demand for 'Todo' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Todo' failed to provide an identifier", id);
        obj = com.marcschwieterman.todo.Todo.findTodo(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Todo' with identifier '" + id + "'", com.marcschwieterman.todo.Todo.findTodo(id));
    }
    
}
