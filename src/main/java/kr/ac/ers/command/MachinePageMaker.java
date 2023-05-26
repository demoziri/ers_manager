package kr.ac.ers.command;

public class MachinePageMaker {
	//화면 출력 시 필요(시스템에서 정의) - service
			private int totalCount; // 전체 행의 개수
			private int startPage = 1; // 시작 페이지 번호
			private int endPage =  1; // 마지막 페이지 번호
			private int realEndPage; // 끝 페이지 번호
			private boolean prev; // 이전페이지 버튼 유무
			private boolean next; // 다음페이지 버튼 유무
			
			private int displayPageNum = 5; // 한 페이지에 보여줄 페이지번호 개수
			
			MachineSearchCriteria machineCri = new MachineSearchCriteria();

			//startPage, endPage, prev, next 설정. by totalCount
			private void calcData() {
				endPage = (int) (Math.ceil(machineCri.getPage() / (double) displayPageNum) * displayPageNum);
				startPage = (endPage - displayPageNum) + 1;
				
				realEndPage = (int) (Math.ceil(totalCount / (double) machineCri.getPerPageNum()));
				
				if(startPage < 0) {
					startPage = 1;
				}
				if(endPage > realEndPage) {
					endPage = realEndPage;
				}
				
				prev = startPage == 1 ? false : true;
				next = endPage < realEndPage ? true : false;
			}
			
			public int getTotalCount() {
				return totalCount;
			}

			public void setTotalCount(int totalCount) {
				//totalCount 들어오면 호출!
				this.totalCount = totalCount;
				calcData();
			}

			public int getStartPage() {
				return startPage;
			}

			public void setStartPage(int startPage) {
				this.startPage = startPage;
			}

			public int getEndPage() {
				return endPage;
			}

			public void setEndPage(int endPage) {
				this.endPage = endPage;
			}

			public int getRealEndPage() {
				return realEndPage;
			}

			public void setRealEndPage(int realEndPage) {
				this.realEndPage = realEndPage;
			}

			public boolean isPrev() {
				return prev;
			}

			public void setPrev(boolean prev) {
				this.prev = prev;
			}

			public boolean isNext() {
				return next;
			}

			public void setNext(boolean next) {
				this.next = next;
			}

			public int getDisplayPageNum() {
				return displayPageNum;
			}

			public void setDisplayPageNum(int displayPageNum) {
				this.displayPageNum = displayPageNum;
			}

			public MachineSearchCriteria getMachineCri() {
				return machineCri;
			}

			public void setMachineCri(MachineSearchCriteria cri) {
				this.machineCri = cri;
			}
			
			
}
