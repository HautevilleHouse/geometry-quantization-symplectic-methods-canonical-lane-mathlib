import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethodsCanonicalLaneLean

structure SymplecticManifoldPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Type v
  symplecticForm : Type w
  closedNondegenerate : Prop
  smoothManifold : Prop
  formClosed : Prop
  formNondegenerate : Prop

structure SymplecticManifoldEvidence (S : SymplecticManifoldPackage) where
  smoothManifoldClosed : S.smoothManifold
  formClosedClosed : S.formClosed
  formNondegenerateClosed : S.formNondegenerate

def SymplecticManifoldClosed (S : SymplecticManifoldPackage) : Prop :=
  S.smoothManifold ∧ S.formClosed ∧ S.formNondegenerate

theorem symplectic_manifold_closed_from_evidence
    (S : SymplecticManifoldPackage) (E : SymplecticManifoldEvidence S) :
    SymplecticManifoldClosed S := by
  exact And.intro E.smoothManifoldClosed
    (And.intro E.formClosedClosed E.formNondegenerateClosed)

end GeometryQuantizationSymplecticMethodsCanonicalLaneLean
end HautevilleHouse
