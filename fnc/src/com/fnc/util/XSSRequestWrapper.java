package com.fnc.util;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class XSSRequestWrapper extends HttpServletRequestWrapper {

	private static Pattern[] patterns = new Pattern[] {
			Pattern.compile("<script>(.*?)</script>", Pattern.CASE_INSENSITIVE),
			Pattern.compile("src[\r\n]*=[\r\n]*\\\'(.*?)\\\'", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("src[\r\n]*=[\r\n]*\\\"(.*?)\\\"", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("</script>", Pattern.CASE_INSENSITIVE),
			Pattern.compile("<script(.*?)>", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("eval\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("fromCharCode\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("expression\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("javascript:", Pattern.CASE_INSENSITIVE),
			Pattern.compile("vbscript:", Pattern.CASE_INSENSITIVE),
			Pattern.compile("document.cookie", Pattern.CASE_INSENSITIVE),
			Pattern.compile("onload", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("oninput", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("layer", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onactivae", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onfocusin", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("applet", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("document", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onclick", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onkeydown", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("xml", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("create", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onbeforecut", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onkeyup", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("link", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("binding", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("ondeactivate", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("msgbox", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("ondragend", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onbounce", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("object=", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("embed", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("ondragleave", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onmovestart", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("frame", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("applet", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("ondragstart", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onmouseout", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("ilayer", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onerror", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onmouseup", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("bgsound", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("href", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("embed", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onabort", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("base", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onstart", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onfocus", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onmovestart", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onmove", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onrowexit", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onunload", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onsubmit", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("innerHTML", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("charset", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onpaste", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("ondblclick", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onresize", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("ondrag", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("expression", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("string", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onselect", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("ondragenter", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onchange", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("append", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onscroll", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("ondragover", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("meta", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("alert", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL | Pattern.UNICODE_CASE | Pattern.UNIX_LINES | Pattern.COMMENTS),
			Pattern.compile("title", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("ondrop", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("void", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("refresh", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("iframe", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("oncopy", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("oncut", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("ilayer", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("blink", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onfinish", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("frameset", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("cookie", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("style", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onreset", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onselectstart", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
			Pattern.compile("onstop", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL)

	};

	public XSSRequestWrapper(HttpServletRequest servletRequest) {

		super(servletRequest);

	}

	@Override
	public String[] getParameterValues(String parameter) {
		// System.out.println("getParameterValues");
		String[] values = super.getParameterValues(parameter);

		if (values == null) {

			return null;

		}

		int count = values.length;

		String[] encodedValues = new String[count];

		for (int i = 0; i < count; i++) {

			encodedValues[i] = stripXSS(values[i]);

		}

		return encodedValues;

	}

	@Override
	public String getParameter(String parameter) {
		// System.out.println("getParameter");
		String value = super.getParameter(parameter);

		return stripXSS(value);

	}

	@Override
	public String getHeader(String name) {
		// System.out.println("getHeader");
		String value = super.getHeader(name);

		return stripXSS(value);

	}

	private String stripXSS(String value) {
		// System.out.println("stripXSS : value= " + value);
		if (value != null) {

			// ESAPI library 이용하여 XSS 필터를 적용하려면 아래 코드의 커맨트
			// 를 제거하고 사용한다. 강력추천!!
			// value = ESAPI.encoder().canonicalize(value);

			// null 문자를 제거한다.
			value = value.replaceAll("\0", "");

			// 패턴을 포함하는 입력에 대해 <, > 을 인코딩한다.
			for (Pattern scriptPattern : patterns) {
				if (scriptPattern.matcher(value).find()) {
					// System.out.println("match.....");
					// System.out.println("stripXSS before : value= " + value);
					value = value.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

					// 추가 변환 - 10.24
					value = value.replaceAll("eval\\(", "");
					value = value.replaceAll("document.cookie", "");
					value = value.replaceAll("fromCharCode\\(", "");
					value = value.replaceAll("expression\\(", "");
					value = value.replaceAll("onload\\(", "");
					value = value.replaceAll("oninput", "");
					value = value.replaceAll("vascript", "");
					value = value.replaceAll("applet", "");
					value = value.replaceAll("xml", "");
					value = value.replaceAll("link", "");
					value = value.replaceAll("script", "");
					value = value.replaceAll("object", "");
					value = value.replaceAll("frame", "");
					value = value.replaceAll("ilayer", "");
					value = value.replaceAll("bgsound", "");
					value = value.replaceAll("base", "");
					value = value.replaceAll("onmove", "");
					value = value.replaceAll("innerHTML", "");
					value = value.replaceAll("charset", "");
					value = value.replaceAll("string", "");
					value = value.replaceAll("append", "");
					value = value.replaceAll("alert", "");
					value = value.replaceAll("refresh", "");
					value = value.replaceAll("ilayer", "");
					value = value.replaceAll("cookie", "");
					value = value.replaceAll("document", "");
					value = value.replaceAll("create", "");
					value = value.replaceAll("binding", "");
					value = value.replaceAll("msgbox", "");
					value = value.replaceAll("embed", "");
					value = value.replaceAll("applet", "");
					value = value.replaceAll("javascript", "");
					value = value.replaceAll("href", "");
					value = value.replaceAll("onstart", "");
					value = value.replaceAll("onrowexit", "");
					value = value.replaceAll("onpaste", "");
					value = value.replaceAll("onresize", "");
					value = value.replaceAll("onselect", "");
					value = value.replaceAll("onscroll", "");
					value = value.replaceAll("title", "");
					value = value.replaceAll("iframe", "");
					value = value.replaceAll("blink", "");
					value = value.replaceAll("style", "");
					value = value.replaceAll("onactivae", "");
					value = value.replaceAll("onclick", "");
					value = value.replaceAll("onbeforecut", "");
					value = value.replaceAll("ondeactivate", "");
					value = value.replaceAll("ondragend", "");
					value = value.replaceAll("ondragleave", "");
					value = value.replaceAll("ondragstart", "");
					value = value.replaceAll("onerror", "");
					value = value.replaceAll("embed", "");
					value = value.replaceAll("onfocus", "");
					value = value.replaceAll("onunload", "");
					value = value.replaceAll("ondblclick", "");
					value = value.replaceAll("ondrag", "");
					value = value.replaceAll("ondragenter", "");
					value = value.replaceAll("ondragover", "");
					value = value.replaceAll("ondrop", "");
					value = value.replaceAll("oncopy", "");
					value = value.replaceAll("onfinish", "");
					value = value.replaceAll("onreset", "");
					value = value.replaceAll("onfocusin", "");
					value = value.replaceAll("onkeydown", "");
					value = value.replaceAll("onkeyup", "");
					value = value.replaceAll("onbounce", "");
					value = value.replaceAll("onmovestart", "");
					value = value.replaceAll("onmouseout", "");
					value = value.replaceAll("onmouseup", "");
					value = value.replaceAll("onabort", "");
					value = value.replaceAll("onmovestart", "");
					value = value.replaceAll("onsubmit", "");
					value = value.replaceAll("vbscript", "");
					value = value.replaceAll("onchange", "");
					value = value.replaceAll("meta", "");
					value = value.replaceAll("void", "");
					value = value.replaceAll("oncut", "");
					value = value.replaceAll("frameset", "");
					value = value.replaceAll("onselectstart", "");

					// System.out.println("stripXSS after : value= " + value);
				}
			}
		}

		return value;

	}

}