package com.revesoft.springboot.web.feedback;

public class FeedbackDTO {

    int id;
    String from;
    String subject;
    String message;
    int action;
    String forwardedTo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getAction() {
        return action;
    }

    public void setAction(int action) {
        this.action = action;
    }

    public String getForwardedTo() {
        return forwardedTo;
    }

    public void setForwardedTo(String forwardedTo) {
        this.forwardedTo = forwardedTo;
    }
}
