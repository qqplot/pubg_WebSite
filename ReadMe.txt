﻿==================================
++ <ver_2.0>			++
++ ReadMe.txt			++
++ 수정날짜 : 2018/05/16 15:40	++
==================================
* 디자인 변경일 뿐 ver_1.0 과 동일한 기능입니다.
* 전체적으로 이미지와 배경 색깔만 넣었습니다.
* sql.txt 를 수정했습니다. DB에 들어가는 레코드를 추가하고 게시판당 알맞은 내용도 넣었습니다.

****** 파일을 실행하기 전에 해야할 것! ******
 1. DB 만들기
  파일을 실행하기 전에 sql.txt에서 쿼리문을 복사하여 그대로 mysql에서 실행하면 됩니다.
  첫 줄에 drop databases를 넣어 놓았기 때문에 언제든 그대로 실행하면 초기화됩니다.

 2. 폴더 만들기 및 설명
  이클립스 프로젝트를 만들어서 아래 주소에 파일들을 복사해 붙여넣으시면 됩니다.
  WebContent/
   - index
   - main
   - images
  src/
   - pubg
*******************************************

==================================
++ <ver_1.1.12>			++
++ ReadMe.txt			++
++ 수정날짜 : 2018/05/16 09:40	++
==================================
* JDBC close 문제 때문에 sql 함수가 작동하지 않던 문제를 해결했습니다.
* 자유게시판에서 글 작성 후 자유게시판 목록이 아닌 메인 첫페이지로 가는 문제를 해결했습니다.

==================================
++ <ver_1.2.0>			++
++ ReadMe.txt			++
++ 수정날짜 : 2018/05/15 17:40	++
==================================
* 버전 총 업데이트 정리했습니다.
* sql.txt 변경했습니다. (테이블 구조 변경)
* 외래키가 not null로 설정 되어있어서 글 작성 후 회원탈퇴시 탈퇴가 불가능하던 문제를 해결했습니다.
 

==================================
++ <ver_1.1.212>			++
++ ReadMe.txt			++
++ 수정날짜 : 2018/05/15 16:30	++
==================================
* qa와 notice 전체 파일 수정 : 
 - JSP 파일은 notice, qa 에 덮어쓰시면 됩니다.  (경로 수정)
* DB 연동 수정 :  
 - java 파일은 pubg.util 에넣으시고 (db query 수정 및 connection 수정)


==================================
++ <ver_1.1.11>			++
++ ReadMe.txt			++
++ 수정날짜 : 2018/05/15 16:00	++
==================================
* 파일 수정 : freeboard 폴더 내 파일 전체
 - 임시적으로 작성했던 [ex) 글번호(regno), 작성자(user_id)] 괄호의 내용들 전부 제거
 - 위 내용의 변동으로 테이블 width가 많이 줄어들어 크기조정(몇몇 td태그에 width설정)
 - 글 삭제 및 취소 시 생기던 스크립트 문제 해결
 - 대부분의 타이틀(<title>)이 default값이던 것을 변경
 - 글 리스트, 제목검색 페이지의 정렬을 글번호의 내림차순으로 변경

* 파일 수정 : FreeBoardJDBC.java
 - 글 수정 관련 쿼리, 함수 추가 : updateFBoardText(String f_title, String f_text, int regno)

* 파일 추가 : free_board_update.jsp
 - 글 수정 페이지
 - free_board_post.jsp파일과 거의 동일하며
 - 글 제목과 글 내용에만 작성 및 수정 가능한 텍스트 박스로 대체됨
 - 수정 버튼 클릭 시 confirm()창 뜸. 확인 시 .._update_submit.jsp로 이동. 취소 시 무반응
 - 초기화 버튼 클릭 시 변동내용 초기화
 - 뒤로가기 버튼 클릭 시 free_board_post.jsp 페이지로 이동

* 파일 추가 : free_board_update_submit.jsp
 - 글 수정 등록 페이지
 - update쿼리 작동 및 alert()창 이후 main.jsp로 이동


==================================
++ <ver_1.1.0>			++
++ ReadMe.txt			++
++ 수정날짜 : 2018/05/15 13:54	++
==================================
* 파일 수정 : JoinCheck.java
 - 동적 쿼리가 먹을 때가 있고 아닐 때가 있어서 정적 쿼리로 바꾸고 함수의 매개변수를 이용하여 동적 구현했습니다.

* 파일 수정 : resign_member.html
 - 탈퇴시 확인 alert 기능을 구현했습니다.

==================================
++ <ver_1.0.3132>			++
++ ReadMe.txt			++
++ 수정날짜 : 2018/05/15 13:26	++
==================================
* 파일 수정 : mainPost.jsp
 - 메인에 include 되는 파일 경로 재설정

* 파일 수정 : DBcon.java
 - sql 비밀번호 재설정


==================================
++ <ver_1.0.213>			++
++ ReadMe.txt			++
++ 수정날짜 : 2018/05/15 09:30	++
==================================
* 버젼 인덱싱 관련 재안내
 - ver_1.(커밋한 횟수).(브런치 수정횟수)(수정한 사람) + ...

* 파일 수정 : FreeBoardJDBC.java
* 파일 수정 : free_board_writing.jsp
 - ver_1.0.11에서 FK 관련 문제를 로그인시 설정된 세션에서 user_id를 받아오는 것으로 수정-해결했습니다.

* 파일 수정 : free_board_post.jsp
- 글 삭제 버튼을 누를 때, 확인 창이 뜨지 않는 문제를 수정했습니다.

==================================
++ <ver_1.0.11>			++
++ ReadMe.txt			++
++ 수정날짜 : 2018/05/14 19:09	++
==================================
* 파일 수정 : free_board_post.jsp
 - 글 삭제 기능 추가

* 파일 수정 : FreeBoardJDBC.java
 - insertFBoardText() : <before> ps.setString(1, user_id); <after> ps.setString(1, "aaa");
 - 현재 DB의 연동 상 글작성 시 user_id의 foreign key 관련 exception 발생.
 - 매개변수는 수정하지 않았지만 임시로 setString을 지정값으로 변경하여 임시 해결.

* 파일 수정 및 삭제 : free_board.jsp제외 모든 파일
 - 전체적으로 하단 버튼 삭제.
 - 원인 : 경로 설정상의 논리 문제.
 - 뒤로가기 버튼 생성으로 해결. => window.history.back(); 함수 이용
 - 글 작성 완료시 자유게시판이 아닌 main.jsp로 이동.

* 파일 수정 : FreeBoardJDBC.java 
 - 글 삭제 함수 추가.
 - deleteFBoardText(int regno) 함수.

* 파일 추가 : free_board_delete.jsp
 - 글보기 페이지 하단에 삭제버튼 추가
 - 삭제버튼 클릭시 free_board_delete.jsp 페이지로 이동
 - 미구현 기능 => 정말 삭제하시겠습니까? 확인 alert() 
 - alert창 확인 이후, JDBC의 delete함수 작동 및 main.jsp로 이동

==================================
++ <ver_1.0>			++
++ ReadMe.txt			++
++ 수정날짜 : 2018/05/14 14:19	++
==================================
 
* 업로드되어 있는 <ver_1.0>는 절대로 수정하지 마세요!
** 수정하려면 <ver_1.0>를 다운을 받은 뒤 컴퓨터에서 작업하세요!
*** 수정할 때에는 파일 인덱스를 다음과 같이 합니다.
	(코드번호) 이예찬: 1, 백종훈: 2, 채규병: 3
	   => ver_1.0.(수정횟수)(코드번호)
	(예시) 예찬 씨가 1번 수정한 ver_1.0은 다음과 같은 인덱스를 가집니다.
 	   => ver_1.0.11

**** 페이지에 기능을 추가하거나 수정할 때마다 아래 <페이지 명세>에 작성할 수 있도록 따로 기록해놓아야 합니다!

***** 파일을 실행하기 전에 해야할 것!
 1. DB 만들기
  파일을 실행하기 전에 sql.txt에서 쿼리문을 복사하여 그대로 mysql에서 실행하면 됩니다.
  첫 줄에 drop databases를 넣어 놓았기 때문에 언제든 그대로 실행하면 초기화됩니다.

 2. 폴더 만들기 및 설명
  이클립스 프로젝트를 만들어서 아래 주소에 파일들을 복사해 붙여넣으시면 됩니다.
  WebContent/
   - index
   - main
   - images
  src/
   - pubg

 index : 로그인 창. 로그인을 해야만 메인창이 실행됩니다.
 main : 하위 폴더에 intro, notice, freeboard, qa가 있습니다. 해당하는 코딩을 여기서 작업하시면 됩니다.
 image : 웹사이트에 사용하는 모든 이미지는 여기에 저장합니다.
 pubg : 하위 폴더로 util이 있습니다. 여기에 자바 파일을 모두 저장합니다.

****** 페이지 명세
(예시)
 free_board.jsp
- 자유게시판
- 글 리스트 전체 출력(f_text{글 내용} 제외)
- 제목 클릭시 페이지 이동 : free_board_post.jsp
- 검색란에 text입력 가능 및 검색버튼 누를 시 페이지 이동 : free_board_search.jsp
- 글쓰기 버튼 클릭시 페이지 이동 : free_board_writing.jsp

==============================