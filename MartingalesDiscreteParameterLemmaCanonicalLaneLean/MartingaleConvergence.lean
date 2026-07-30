import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure DiscreteMartingalePackage where
  indexSet : Type u
  filtration : Nat → Set (Set (indexSet → ℝ))
  adaptedProcess : Nat → (indexSet → ℝ)
  integrability : Prop
  adaptedness : Prop
  martingaleProperty : Prop

structure DiscreteMartingaleEvidence (M : DiscreteMartingalePackage) where
  integrabilityClosed : M.integrability
  adaptednessClosed : M.adaptedness
  martingalePropertyClosed : M.martingaleProperty

def DiscreteMartingaleClosed (M : DiscreteMartingalePackage) : Prop :=
  M.integrability ∧ M.adaptedness ∧ M.martingaleProperty

theorem discrete_martingale_closed_from_evidence (M : DiscreteMartingalePackage)
    (E : DiscreteMartingaleEvidence M) : DiscreteMartingaleClosed M := by
  exact And.intro E.integrabilityClosed (And.intro E.adaptednessClosed E.martingalePropertyClosed)

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse