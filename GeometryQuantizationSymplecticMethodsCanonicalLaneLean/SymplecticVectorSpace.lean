import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethods

structure SymplecticVectorSpace where
  carrier : Type u
  field : Type v
  addition : carrier → carrier → carrier
  scalarMultiplication : carrier → carrier → carrier
  symplecticForm : carrier → carrier → field
  bilinear : Prop
  skewSymmetric : Prop
  nondegenerate : Prop
  closed : Prop

structure SymplecticVectorSpaceEvidence (V : SymplecticVectorSpace) where
  bilinearClosed : V.bilinear
  skewSymmetricClosed : V.skewSymmetric
  nondegenerateClosed : V.nondegenerate
  closedClosed : V.closed

def SymplecticVectorSpaceClosed (V : SymplecticVectorSpace) : Prop :=
  V.bilinear ∧ V.skewSymmetric ∧ V.nondegenerate ∧ V.closed

theorem symplectic_vector_space_closed_from_evidence (V : SymplecticVectorSpace) (E : SymplecticVectorSpaceEvidence V) : SymplecticVectorSpaceClosed V := by
  exact And.intro E.bilinearClosed (And.intro E.skewSymmetricClosed (And.intro E.nondegenerateClosed E.closedClosed))

end GeometryQuantizationSymplecticMethods
end HautevilleHouse