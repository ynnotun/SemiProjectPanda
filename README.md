# 중고거래 플랫폼 PANDA
<img src="/src/main/resources/static/image/panda.png" width="370" height="370">
- 배포 URL : http://175.45.204.203:8090/

<br>

## 프로젝트 소개
- 기존의 중고거래 플랫폼의 불편사항을 개선한 새로운 형태의 중고거래 플랫폼
- 최초 사용자들을 위한 챗봇 기능 지원
- 기기 제한 없이 모든 웹 환경에 최적화

<br>

## 팀원 구성
<div align="center">
| **유니** | **정민석** | **김창인** | **공병현** | **이병현** | **우태형** |
| :------: |  :------: | :------: | :------: | :------: | :------: |
| [@ynnotun](https://github.com/ynnotun) | [@minseok0507](https://github.com/minseok0507) | [@ckddls1024](https://github.com/ckddls1024) | [@kongbh730](https://github.com/kongbh730) | [@LBang98](https://github.com/LBang98) | [@taehyoung809](https://github.com/taehyoung809) |
</div>

<br>

## 1. 개발 환경
- Front : HTML, CSS, JavaScript, Jquery, Tailwind
- Back-end : Spring Boot, mybatis
- 버전 관리 : Git, Github
- 협업 툴 : JIRA, Trello
- 서비스 배포 환경 : Jenkins, Maven, docker, Tomcat

## 2. 채택한 개발 기술과 브랜치 전략
### 브랜치 전략
- main, test, deploy 브랜치와 팀원별 브랜치를 나누어 진행했습니다.
    - **main** test 브랜치에서 test가 끝난 코드를 올리는 브랜치입니다
    - **test** 브랜치는 개발 단계에서 main 역할을 하는 브랜치입니다. 팀원들의 branch에서 코드를 병합하는 브랜치입니다.
    - **deploy** 브랜치는 배포 단계에서만 사용하는 브랜치입니다.
 
  
## 3. 역할 분담
### 유니
- **UI**
    - 페이지 : 메인 홈, 마이페이지
- **기능**
    - 메인 홈에서 제품 무한 스크롤 적용
    - 마이페이지에서 출력되는 정보 호출(회원 정보, 회원 등급, 제품 목록, 리뷰 출력)
<br>
### 정민석
- **UI**
    - 페이지 : 프로필 설정, 프로필 수정, 팔로잉&팔로워 리스트, 상품 등록, 상품 수정, 채팅 목록, 404 페이지
    - 공통 컴포넌트 : 탭메뉴, InputBox, Alert 모달, 댓글
- **기능**
    - 프로필 설정 및 수정 페이지 유저 아이디 유효성 및 중복 검사, 상품 등록 및 수정
<br>
### 김창인
- **UI**
    - 페이지 : 프로필 설정, 프로필 수정, 팔로잉&팔로워 리스트, 상품 등록, 상품 수정, 채팅 목록, 404 페이지
    - 공통 컴포넌트 : 탭메뉴, InputBox, Alert 모달, 댓글
- **기능**
    - 프로필 설정 및 수정 페이지 유저 아이디 유효성 및 중복 검사, 상품 등록 및 수정
<br>
### 공병현
- **UI**
    - 페이지 : 상품 등록, 상품 수정
- **기능**
    - 중고 상품 등록 및 수정
    - 버킷내 이미지 삽입, 삭제 관리
<br>
### 이병현
- **UI**
    - 페이지 : 프로필 설정, 프로필 수정, 팔로잉&팔로워 리스트, 상품 등록, 상품 수정, 채팅 목록, 404 페이지
    - 공통 컴포넌트 : 탭메뉴, InputBox, Alert 모달, 댓글
- **기능**
    - 프로필 설정 및 수정 페이지 유저 아이디 유효성 및 중복 검사, 상품 등록 및 수정
<br>
### 우태형
- **UI**
    - 페이지 : 마이페이지 상세, 검색 페이지
- **기능**
    - 판매된 제품 Sold 표시
    - 마이페이지 상세에 목록 별 제품 호출
    - 검색어에 대한 결과물 출력
    
## 4. 개발 기간 및 작업 관리
### 개발 기간
- 전체 개발 기간 : 2024-05-22 ~ 2024-07-02
- 프론트 개발 : 2024-05-22 ~ 2024-06-14
- 백엔드 개발  : 2024-06-14 ~ 2024-07-02

<br>

### 작업 관리
- GitHub Projects와 Issues를 사용하여 진행 상황을 공유했습니다.
- 주간회의를 진행하며 작업 순서와 방향성에 대한 고민을 나누고 GitHub Wiki에 회의 내용을 기록했습니다.

  
## 프로젝트 자료
- [최종 발표 자료](pdf로 첨부할듯)
- [기능 시연 영상](https://www.youtube.com/watch?v=jMFjW18qeZ4)
