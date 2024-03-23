actor Calc {

  var cell : Int = 0;

  public func add(n : Int) : async Int {
    cell += n;
    return cell;
  };

  public func sub(n : Int) : async Int {
    cell -= n;
    return cell;
  };

  public func mul(n : Int) : async Int {
    cell *= n;
    return cell;
  };

  public func div(n : Int) : async ?Int {
    if (n == 0) {
      return null;
    } else {
      cell /= n;
      return ?cell;
    };
  };

  public func clearall() : async () {
    cell := 0;
  };

  public func pow(n: Int) : async Int{

    var temp : Int = cell;
    var res : Int = cell;
    var power : Int = n-1;

    while (power > 0){
      res *= temp;
      power -= 1;
    };
    if(n == 0){
      res := 1;
    };
    cell := res;
    return cell;
  };
};
