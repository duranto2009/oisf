package com.revesoft.springboot.web.menumanagement;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by reve on 11/30/2017.
 */
public class Node<T> {
    private List<Node<T>> children = new ArrayList<Node<T>>();
    private Node<T> parent = null;
    private T data = null;

    public Node(T data) {
        this.data = data;
    }

    public Node(T data, Node<T> parent) {
        this.data = data;
        this.parent = parent;
    }

    public List<Node<T>> getChildren() {
        return children;
    }


    public Node<T> addChild(T data) {
        Node<T> child = new Node<T>(data);
        //child.setParent(this);
        child.parent = this;
        this.children.add(child);
        return child;
    }

    public T getData() {
        return this.data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public boolean isRoot() {
        return (this.parent == null);
    }

    public boolean isLeaf() {
        if(this.children.size() == 0)
            return true;
        else
            return false;
    }

    public void removeParent() {
        this.parent = null;
    }
}
