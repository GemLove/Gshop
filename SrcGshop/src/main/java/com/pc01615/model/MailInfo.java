package com.pc01615.model;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailInfo {
	@NotBlank
	@Email
	String from;
	@NotBlank
	@Email
	String to;
	String[] cc;
	String[] bcc;
	@NotEmpty
	String subject;
	@NotBlank
	String body;
	List<String> attachments = new ArrayList<String>();

	public MailInfo(String to, String subject, String body) {
		this.from = "Gshop";
		this.to = to;
		this.subject = subject;
		this.body = body;
	}
}
