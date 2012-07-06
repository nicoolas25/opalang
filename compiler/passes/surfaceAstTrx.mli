(*
    Copyright © 2011 MLstate

    This file is part of OPA.

    OPA is free software: you can redistribute it and/or modify it under the
    terms of the GNU Affero General Public License, version 3, as published by
    the Free Software Foundation.

    OPA is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for
    more details.

    You should have received a copy of the GNU Affero General Public License
    along with OPA. If not, see <http://www.gnu.org/licenses/>.
*)
(**
   Translation from parsers (essentially: parsing expression grammars' AST)
   to OPA code implementing them.

   @author Adam Koprowski
*)

val translate_rule :
  (string, [< SurfaceAst.all_directives > `coerce] as 'a)
  SurfaceAst.expr Trx_ast.expr -> (string, 'a) SurfaceAst.expr