import MartingalesDiscreteParameterLemmaCanonicalLaneLean.MartingaleStopping

/-!
# Quadratic Variation and Square Bracket Process Package
-/

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure SquareBracketProcessPackage {Ω : Type u} [MeasurableSpace Ω] {E : Type v} [NormedAddCommGroup E] [HilbertSpace E] {ℱ : Filtration ℕ (MeasurableSpace Ω)} (M : MartingalePackage Ω ℱ E) where
  quadraticVariation : ℕ → Ω → ℝ
  polarizationIdentity : Prop
  optionalSamplingTheorem : Prop
  bracketProcess : ℕ → Ω → ℝ

structure SquareBracketProcessEvidence {Ω : Type u} [MeasurableSpace Ω] {E : Type v} [NormedAddCommGroup E] [HilbertSpace E] {ℱ : Filtration ℕ (MeasurableSpace Ω)} (M : MartingalePackage Ω ℱ E) (S : SquareBracketProcessPackage M) where
  quadraticVariationMeasurable : ∀ (n : ℕ), Measurable (S.quadraticVariation n)
  polarizationIdentityClosed : S.polarizationIdentity
  optionalSamplingClosed : S.optionalSamplingTheorem
  bracketProcessMeasurable : ∀ (n : ℕ), Measurable (S.bracketProcess n)

def SquareBracketProcessClosed {Ω : Type u} [MeasurableSpace Ω] {E : Type v} [NormedAddCommGroup E] [HilbertSpace E] {ℱ : Filtration ℕ (MeasurableSpace Ω)} (M : MartingalePackage Ω ℱ E) (S : SquareBracketProcessPackage M) : Prop :=
  S.polarizationIdentity ∧ S.optionalSamplingTheorem

theorem square_bracket_process_closed_from_evidence {Ω : Type u} [MeasurableSpace Ω] {E : Type v} [NormedAddCommGroup E] [HilbertSpace E] {ℱ : Filtration ℕ (MeasurableSpace Ω)} (M : MartingalePackage Ω ℱ E) (S : SquareBracketProcessPackage M) (E' : SquareBracketProcessEvidence M S) : SquareBracketProcessClosed M S := by
  exact And.intro E'.polarizationIdentityClosed E'.optionalSamplingClosed

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse