import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.SymplecticVectorSpace

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethodsCanonicalLaneLean

structure MetalinearStructure (V : SymplecticVectorSpace) where
  bundle : Type u
  projection : bundle → V.carrier
  fiberIsGL : Prop
  doubleCover : Prop
  liftOfSymplecticFrame : Prop
  compatibilityWithSymplecticForm : Prop
  fiberIsGLTerm : fiberIsGL
  doubleCoverTerm : doubleCover
  liftOfSymplecticFrameTerm : liftOfSymplecticFrame
  compatibilityWithSymplecticFormTerm : compatibilityWithSymplecticForm

structure MetalinearStructureEvidence {V : SymplecticVectorSpace} (M : MetalinearStructure V) where
  fiberIsGLClosed : M.fiberIsGL
  doubleCoverClosed : M.doubleCover
  liftOfSymplecticFrameClosed : M.liftOfSymplecticFrame
  compatibilityWithSymplecticFormClosed : M.compatibilityWithSymplecticForm

def MetalinearStructureClosed {V : SymplecticVectorSpace} (M : MetalinearStructure V) : Prop :=
  M.fiberIsGL ∧ M.doubleCover ∧ M.liftOfSymplecticFrame ∧ M.compatibilityWithSymplecticForm

theorem metalinear_structure_closed_from_evidence {V : SymplecticVectorSpace}
    (M : MetalinearStructure V) (E : MetalinearStructureEvidence M) :
    MetalinearStructureClosed M := by
  exact And.intro E.fiberIsGLClosed (And.intro E.doubleCoverClosed (And.intro E.liftOfSymplecticFrameClosed E.compatibilityWithSymplecticFormClosed))

end GeometryQuantizationSymplecticMethodsCanonicalLaneLean
end HautevilleHouse
