import Nat32 "mo:base/Nat32";
import Trie "mo:base/Trie";
import Option "mo:base/Option";
import List "mo:base/List";
import Text "mo:base/Text";
import Result "mo:base/Result";


actor SuperHeros{

  public type SuperHeroId = Nat32;

  public type SuperHero = {
    name: Text;
    superpowers: List.List<Text>;
  };

  private stable var next: SuperHeroId = 0;
  private stable var superheroes: Trie.Trie<SuperHeroId, SuperHero> = Trie.empty();

  public func create(superhero: SuperHero) : async SuperHeroId{
    let superHeroId = next;
    next += 1;
    superheroes := Trie.replace(
      superheroes,
      key(superHeroId),
      Nat32.equal,
      ?superhero,
    ).0;
    superHeroId
  };

  public query func read(superHeroId: SuperHeroId) : async ?SuperHero {
    let result = Trie.find(superheroes, key(superHeroId), Nat32.equal);
    result
  };

  public func update(superHeroId: SuperHeroId, superhero: SuperHero): async Bool {
    let result = Trie.find(superheroes, key(superHeroId), Nat32.equal);
    let exists = Option.isSome(result);
    if(exists) {
      superheroes := Trie.replace (
        superheroes,
        key(superHeroId),
        Nat32.equal,
        ?superhero,
      ).0;
    };
    exists

  };

  public func delete(superHeroId: SuperHeroId): async Bool {
    let result = Trie.find(superheroes, key(superHeroId), Nat32.equal);
    let exists = Option.isSome(result);
    if(exists) {
      superheroes := Trie.replace(
      superheroes,
      key(superHeroId),
      Nat32.equal,
      null,
      ).0;
    };
    exists
  };

  private func key(x: SuperHeroId): Trie.Key<SuperHeroId> {
    { hash = x; key = x };
  }
}