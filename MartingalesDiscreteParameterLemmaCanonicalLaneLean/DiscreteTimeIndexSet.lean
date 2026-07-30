import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure DiscreteTimeIndexSet where
  indexType : Type u
  order : indexType → indexType → Prop
  discreteTotality : Prop
  initialElement : indexType
  initialElementExists : ∃ (i : indexType), ∀ (j : indexType), order i j

def DiscreteTimeIndexSetClosed (D : DiscreteTimeIndexSet) : Prop :=
  D.discreteTotality ∧ D.initialElementExists

-- evidence structure
structure DiscreteTimeIndexSetEvidence (D : DiscreteTimeIndexSet) where
  discreteTotalityClosed : D.discreteTotality
  initialElementExistsClosed : D.initialElementExists

theorem discrete_time_index_set_closed_from_evidence (D : DiscreteTimeIndexSet) (E : DiscreteTimeIndexSetEvidence D) : DiscreteTimeIndexSetClosed D := by
  exact And.intro E.discreteTotalityClosed E.initialElementExistsClosed

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse