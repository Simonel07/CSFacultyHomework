package org.example.seminar1.factories;

import org.example.seminar1.containers.Container;
import org.example.seminar1.containers.QueueContainer;
import org.example.seminar1.containers.StackContainer;

public class TaskContainerFactory implements Factory {
    private final static TaskContainerFactory taskContainerFactory = new TaskContainerFactory();

    private TaskContainerFactory() {
    }

    public static TaskContainerFactory getInstance() {
        return taskContainerFactory;
    }

    @Override
    public Container createContainer(Strategy strategy) {
        //daca e lifo, returneaza stack
        if (strategy == Strategy.LIFO) {
            return new StackContainer();
        }
        //daca e fifo returneaza coada
        if(strategy==Strategy.FIFO) {
            return new QueueContainer();
        }
        return null;
    }
}
