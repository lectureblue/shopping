$(function() {
  $('#summernote').summernote({
    //codeviewFilter: false, // 코드 보기 필터 비활성화
    //codeviewIframeFilter: false, // 코드 보기 iframe 필터 비활성화

    height: 500, // 에디터 높이
    minHeight: null, // 최소 높이
    maxHeight: null, // 최대 높이
    focus: true, // 에디터 로딩 후 포커스 설정
    lang: 'ko-KR', // 언어 설정 (한국어)

    toolbar: [
      ['style',['style']],
      ['fontname', ['fontname']], // 글자 스타일 설정 옵션
      ['fontsize', ['fontsize']], // 글꼴 크기 설정 옵션
      ['font', ['bold', 'underline', 'clear']], // 글자 굵게, 밑줄, 포맷 제거 옵션
      ['color', ['color']], // 글자 색상 설정 옵션
      ['table', ['table']], // 테이블 삽입 옵션
      ['para', ['ul', 'ol', 'paragraph']], // 문단 스타일, 순서 없는 목록, 순서 있는 목록 옵션
      ['height', ['height']], // 에디터 높이 조절 옵션
      ['insert', ['picture', 'link', 'video']], // 이미지 삽입, 링크 삽입, 동영상 삽입 옵션
      ['view', ['codeview', 'fullscreen', 'help']], // 코드 보기, 전체 화면, 도움말 옵션
    ],

    fontSizes: [
      '8', '9', '10', '11', '12', '14', '16', '18',
      '20', '22', '24', '28', '30', '36', '50', '72',
    ], // 글꼴 크기 옵션
    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '바탕체'],

    styleTags: [
      'p',  // 일반 문단 스타일 옵션
      {
        title: 'Blockquote',
        tag: 'blockquote',
        className: 'blockquote',
        value: 'blockquote',
      },  // 인용구 스타일 옵션
      'pre',  // 코드 단락 스타일 옵션
      {
        title: 'code_light',
        tag: 'pre',
        className: 'code_light',
        value: 'pre',
      },  // 밝은 코드 스타일 옵션
      {
        title: 'code_dark',
        tag: 'pre',
        className: 'code_dark',
        value: 'pre',
      },  // 어두운 코드 스타일 옵션
      'h1', 'h2', 'h3', 'h4', 'h5', 'h6',  // 제목 스타일 옵션
    ],

    callbacks: {
      onImageUpload: function(files) {

        let $editor = $(this);
        let data = new FormData();
        data.append('file', files[0]);
        $.ajax({
          url: 'summernote_upload',
          method: 'POST',
          data: data,
          processData: false,
          contentType: false,
          success: function(response) {
            $editor.summernote('insertImage', response);
          }
        });
      },
    },//callbacks
  })
})

