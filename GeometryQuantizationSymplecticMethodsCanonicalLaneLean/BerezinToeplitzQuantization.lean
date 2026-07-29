import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.SymplecticVectorSpace

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethodsCanonicalLaneLean

structure BerezinToeplitzQuantization (V : SymplecticVectorSpace) where
  kahlerStructure : Type u
  kahlerMetric : Prop
  coherentStates : Prop
  toplitzOperator : (V.carrier → ℂ) → (ℌ → ℌ)
  hilbertSpace : ℌ : Type v → Type v
  operatorNormBounded : Prop
  productRule : Prop
  kahlerMetricTerm : kahlerMetric
  coherentStatesTerm : coherentStates
  operatorNormBoundedTerm : operatorNormBounded
  productRuleTerm : productRule

structure BerezinToeplitzQuantizationEvidence {V : SymplecticVectorSpace} (B : BerezinToeplitzQuantization V) where
  kahlerMetricClosed : B.kahlerMetric
  coherentStatesClosed : B.coherentStates
  operatorNormBoundedClosed : B.operatorNormBounded
  productRuleClosed : B.productRule

def BerezinToeplitzQuantizationClosed {V : SymplecticVectorSpace} (B : BerezinToeplitzQuantization V) : Prop :=
  B.kahlerMetric ∧ B.coherentStates ∧ B.operatorNormBounded ∧ B.productRule

theorem berezin_toeplitz_quantization_closed_from_evidence {V : SymplecticVectorSpace}
    (B : BerezinToeplitzQuantization V) (E : BerezinToeplitzQuantizationEvidence B) :
    BerezinToeplitzQuantizationClosed B := by
  exact And.intro E.kahlerMetricClosed (And.intro E.coherentStatesClosed (And.intro E.operatorNormBoundedClosed E.productRuleClosed))

end GeometryQuantizationSymplecticMethodsCanonicalLaneLean
end HautevilleHouse
