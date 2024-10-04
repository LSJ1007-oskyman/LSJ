package service;

public class ActionForward {
	private boolean redirect;
	private String Path;
	
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	public String getPath() {
		return Path;
	}
	public void setPath(String path) {
		Path = path;
	}

}
