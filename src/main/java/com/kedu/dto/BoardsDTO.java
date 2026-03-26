package com.kedu.dto;

import java.sql.Timestamp;

public class BoardsDTO {
	private int seq;
	private String writer;
	private String title;
	private String contents;
	private int view_count;
	private Timestamp write_number;
	
	public BoardsDTO() {}

	public BoardsDTO(int seq, String writer, String title, String contents, int view_count, Timestamp write_number) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.view_count = view_count;
		this.write_number = write_number;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public Timestamp getWrite_number() {
		return write_number;
	}

	public void setWrite_number(Timestamp write_number) {
		this.write_number = write_number;
	};
	
	
}
