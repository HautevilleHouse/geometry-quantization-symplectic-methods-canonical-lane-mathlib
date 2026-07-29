import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.PrequantumLineBundle

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethodsCanonicalLaneLean

structure KostantSouriauOperator (V : SymplecticVectorSpace) (B : PrequantumLineBundle V) where
  smoothFunctions : Type u
  operator : smoothFunctions → smoothFunctions
  covariance : ∀ (f g : smoothFunctions), operator (f * g) = (operator f) * g + f * (operator g)
  equivariance : ∀ (f : smoothFunctions) (v : V.carrier), operator (X_v f) = B.connection (X_v f)
    where X_v : (V.carrier → ℝ) → (V.carrier → ℝ) := λ g w => V.symplecticForm w v

structure KostantSouriauOperatorEvidence {V : SymplecticVectorSpace}
    {B : PrequantumLineBundle V} (K : KostantSouriauOperator V B) where
  covarianceClosed : K.covariance
  equivarianceClosed : K.equivariance

def KostantSouriauOperatorClosed {V : SymplecticVectorSpace}
    {B : PrequantumLineBundle V} (K : KostantSouriauOperator V B) : Prop :=
  K.covariance ∧ K.equivariance

theorem kostant_souriau_operator_closed_from_evidence {V : SymplecticVectorSpace}
    {B : PrequantumLineBundle V} (K : KostantSouriauOperator V B)
    (E : KostantSouriauOperatorEvidence K) : KostantSouriauOperatorClosed K := by
  exact And.intro E.covarianceClosed E.equivarianceClosed

end GeometryQuantizationSymplecticMethodsCanonicalLaneLean
end HautevilleHouse
