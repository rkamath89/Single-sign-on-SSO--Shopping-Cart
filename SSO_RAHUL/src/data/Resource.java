package data;

public class Resource {

	public String resId;
	public String read;
	public String write;
	public String execute;

	public String resName;
	public String path;

	public Resource() {

	}

	public Resource(String resId, String read, String write, String execute) {
		super();
		this.resId = resId;
		this.read = read;
		this.write = write;
		this.execute = execute;
	}

	public String getResId() {
		return resId;
	}

	public void setResId(String resId) {
		this.resId = resId;
	}

	public String getRead() {
		return read;
	}

	public void setRead(String read) {
		this.read = read;
	}

	public String getWrite() {
		return write;
	}

	public void setWrite(String write) {
		this.write = write;
	}

	public String getExecute() {
		return execute;
	}

	public void setExecute(String execute) {
		this.execute = execute;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
