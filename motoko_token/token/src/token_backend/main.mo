import Iccr1Ledger "canister:iccr1_ledger_canister";
import Nat "mo:base/Nat";
import Error "mo:base/Error";
import Blob "mo:base/Blob";
import Option "mo:base/Option";
import Result "mo:base/Result";
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";

actor {

  type Account = {
    owner: Principal;
    sunaccount: ?[Nat8]; 
  };

  type TransferArgs = {
    amount: Nat;
    toAccount: Account;
  };

  public shared ({caller}) func transfer(args : TransferArgs): async Result<Iccr1Ledger.BlockIndex, Text> {

  };
}