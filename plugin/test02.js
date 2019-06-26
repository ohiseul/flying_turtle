// 즉시실행 함수 - 충돌 막기위해
(function ($) {
    let changeComma = function (val){
        // 문자열로 변환 : 숫자가 들어와도 ","를 넣기 위해
        // replace : 넘겨받는 값에 만약 ","가 포함되어있다면 없애준다.
        // /정규표현식/ 
        // /,/g : 모든 ,를 찾아서 공백으로 바꿔준다.
        val = val.toString().replace(/,/g, "");
        // ^[+-] : 처음이 + 또는 - 문자로 시작하는 것
        // ?    : 없을 수도 있고 하나가 올 수도 있다.
        // \d   : 숫자
        // \d{3} : 숫자 3개 선택    - 뒤에 있는 \d{3}이 우선순위를가진다.

        let pattern = /(^[+-]?\d)(\d{3})/;
        
        // pettern.test(val) : 넘겨받은 값 val이 pattern에 일치하는가?
        // 
        while(pattern.test(val)){
            val = val.replace(pattern, "$1" + "," + "$2");
            // 예) val = 1234567
            // \d : 1234  \d{3}: 567 
        }
        return val;
    };

    // fn : 프로토타입
    $.fn.comma = function () {
    let ele = this;     // 여기서 this는 제이쿼리 객체가 된다.
    this.keyup(function () {
            ele.val(changeComma(ele.val()));
        });
    };
})(jQuery);
