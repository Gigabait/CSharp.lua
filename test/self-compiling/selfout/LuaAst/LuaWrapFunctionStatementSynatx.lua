-- Generated by CSharp.lua Compiler 1.1.0
--[[
Copyright 2017 YANG Huan (sy.yanghuan@gmail.com).

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
]]
local System = System
local CSharpLuaLuaAst
System.usingDeclare(function (global) 
  CSharpLuaLuaAst = CSharpLua.LuaAst
end)
System.namespace("CSharpLua.LuaAst", function (namespace) 
  namespace.class("LuaWrapFunctionStatementSynatx", function (namespace) 
    local UpdateIdentifiers, getBody, AddStatement, AddStatements, Render, __init__, __ctor__
    __init__ = function (this) 
      this.function_ = CSharpLuaLuaAst.LuaFunctionExpressionSyntax()
    end
    __ctor__ = function (this) 
      __init__(this)
      CSharpLuaLuaAst.LuaStatementSyntax.__ctor__(this)
    end
    UpdateIdentifiers = function (this, name, target, memberName, parameter) 
      local memberAccess = CSharpLuaLuaAst.LuaMemberAccessExpressionSyntax(target, memberName, false)
      local invoke = CSharpLuaLuaAst.LuaInvocationExpressionSyntax:new(1, memberAccess)
      invoke:AddArgument(CSharpLuaLuaAst.LuaStringLiteralExpressionSyntax(name))
      invoke:AddArgument(this.function_)
      if parameter ~= nil then
        this.function_:AddParameter1(parameter)
      end
      this.Statement = CSharpLuaLuaAst.LuaExpressionStatementSyntax(invoke)
    end
    getBody = function (this) 
      return this.function_.Body
    end
    AddStatement = function (this, statement) 
      getBody(this).Statements:Add(statement)
    end
    AddStatements = function (this, statements) 
      getBody(this).Statements:AddRange(statements)
    end
    Render = function (this, renderer) 
      renderer:Render1(this)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end, 
      UpdateIdentifiers = UpdateIdentifiers, 
      getBody = getBody, 
      AddStatement = AddStatement, 
      AddStatements = AddStatements, 
      Render = Render, 
      __ctor__ = __ctor__
    }
  end)

  namespace.class("LuaNamespaceDeclarationSyntax", function (namespace) 
    local __ctor__
    __ctor__ = function (this, name, isContained) 
      this.__base__.__ctor__(this)
      local default
      if isContained then
        default = CSharpLuaLuaAst.LuaIdentifierNameSyntax.Namespace
      else
        default = CSharpLuaLuaAst.LuaIdentifierNameSyntax.System1
      end
      this:UpdateIdentifiers(name, default, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Namespace, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Namespace)
    end
    return {
      __inherits__ = function (global) 
        return {
          global.CSharpLua.LuaAst.LuaWrapFunctionStatementSynatx
        }
      end, 
      __ctor__ = __ctor__
    }
  end)
end)
