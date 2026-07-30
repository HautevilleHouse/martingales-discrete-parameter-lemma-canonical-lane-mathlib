import MartingalesDiscreteParameterLemmaCanonicalLaneLean.StoppingTime

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure QuadraticVariationPackage {M : MartingaleAdmittedObject} {S : StoppingTimePackage M.index} where
  quadraticVariation : Type u
  angleBracket : Type v
  doobMeyerDecomposition : Prop
  bracketRelation : Prop
  quadraticVariationClosed : quadraticVariation
  angleBracketClosed : angleBracket
  doobMeyerDecompositionClosed : doobMeyerDecomposition
  bracketRelationClosed : bracketRelation

structure QuadraticVariationEvidence {M : MartingaleAdmittedObject} {S : StoppingTimePackage M.index}
    (Q : QuadraticVariationPackage) where
  quadraticVariationClosed : Q.quadraticVariation
  angleBracketClosed : Q.angleBracket
  doobMeyerDecompositionClosed : Q.doobMeyerDecomposition
  bracketRelationClosed : Q.bracketRelation

def QuadraticVariationClosed {M : MartingaleAdmittedObject} {S : StoppingTimePackage M.index}
    (Q : QuadraticVariationPackage) : Prop :=
  Q.quadraticVariation ∧ Q.angleBracket ∧ Q.doobMeyerDecomposition ∧ Q.bracketRelation

theorem quadratic_variation_closed_from_evidence {M : MartingaleAdmittedObject}
    {S : StoppingTimePackage M.index} (Q : QuadraticVariationPackage)
    (E : QuadraticVariationEvidence Q) : QuadraticVariationClosed Q := by
  exact And.intro E.quadraticVariationClosed
    (And.intro E.angleBracketClosed
      (And.intro E.doobMeyerDecompositionClosed E.bracketRelationClosed))

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse