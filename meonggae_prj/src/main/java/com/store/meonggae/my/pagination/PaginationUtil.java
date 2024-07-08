package com.store.meonggae.my.pagination;

public class PaginationUtil {
	
	private static PaginationUtil pu;
	
	private PaginationUtil() {
	}
	
	public static PaginationUtil getInstance() {
		if(pu == null) {
			pu=new PaginationUtil();
		}//end if
		return pu;
	}//getInstance
	
	public String pagiNation(String url, String param, int totalPage, int currentPage) {
		StringBuilder pagiNation = new StringBuilder();
		
		//1.한 화면에서 보여줄 페이지 인덱스 수
	 	int pageNumber = 5;
	 	
	 	//2. 화면에 보여줄 시작 페이지 번호
		int startPage = ((currentPage-1)/pageNumber)*pageNumber+1;
		
		//3. 화면에 보여줄 마지막 페이지 번호
		int endPage=(((startPage-1)+pageNumber)/pageNumber)*pageNumber;
		
		//4. 총 페이지의 수가 연산된 마지막페이지 수보다 작다면 총 페이지 수가 마지막 페이지 번호로 설정된다.
		if(totalPage <= endPage ){
			endPage = totalPage;
		}//if
		
		//처음으로 버튼 생성
		if (totalPage > 0) {
		pagiNation.append("<a href='")
					.append(url)
					.append("?currentPage=1")
					.append(param)
					.append("'><input type='button' class='btn btn-sm btn-light marginL' style='margin:0px auto;' value='처음 페이지'/></a>&nbsp;&nbsp;&nbsp;");
		}//if
		
		int movePage = 0;
		if(currentPage > pageNumber){
			movePage = startPage-1;
			pagiNation.append("<a href='")
						.append(url)
						.append("?currentPage=")
						.append(movePage)
						.append(param)
						.append("'> value='&lt;&lt;'/></a>");
		}//if
		
		//숫자 버튼 생성
		movePage=startPage;
		while(  movePage <= endPage ){
			if( movePage == currentPage){//현재 페이지에 대해서는 링크를 생성하지 않는다.
				pagiNation.append("<input type='button' class='btn btn-sm btn-secondary marginL' value='")
							.append(currentPage)
							.append("'/>&nbsp");
			}else {
				pagiNation.append("<a href='")
							.append(url)
							.append("?currentPage=")
							.append(movePage)
							.append(param)
							.append("'><input type='button' class='btn btn-sm btn-light marginL' value='")
							.append(movePage)
							.append("'/></a>&nbsp");
			}//else
			movePage++;
		}//while
		
		//7. 뒤에 페이지가 더 있는 경우
		if (totalPage > endPage) {
            movePage = endPage + 1;
            pagiNation.append("&nbsp;&nbsp;&nbsp;<a href='")
            			.append(url)
            			.append("?currentPage=")
            			.append(movePage)
            			.append(param)
            			.append("'><input type='button' class='btn btn-sm btn-light marginL' value='&gt;&gt;'/></a>");
        }//if
		
		//마지막 페이지 버튼 생성
		if (totalPage > 0) {
			pagiNation.append("&nbsp;&nbsp;&nbsp;<a href='")
						.append(url).append("?currentPage=")
						.append(totalPage)
						.append(param)
						.append("'><input type='button' class='btn btn-sm btn-light marginL' style='margin:0px auto;' value='마지막 페이지'/></a>");
        }//if
		
		return pagiNation.toString();
	}//pagiNation
	
	/**
	 * 페이지 당 물품 갯수
	 * 16개
	 */
	public int pageScale() {
        return 16;
    }//pageScale
	
	public SearchVO startNum(String memnum, int currentPage, int pageScale) {
		SearchVO sVO = null;
		
		int startNum = (currentPage * pageScale-pageScale) + 1;
		int endNum = startNum + pageScale - 1;
		
		sVO = new SearchVO(memnum, startNum, endNum);
		System.out.println("searchVO : " + sVO);
		
		return sVO;
	}//startNum
}