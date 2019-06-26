$.arr = function(obj, type) {
    let result;
    if(type == "sum"){
        let sum = 0;
        for(let val of obj){
            sum += val;
        }
        result = sum;
    } else if(type == "max"){
        let max = 0;
        for(let i=0; i<obj.length; i++){
            if(max < obj[i]){
                max = obj[i];
            }
        }
    }
    return result;
};