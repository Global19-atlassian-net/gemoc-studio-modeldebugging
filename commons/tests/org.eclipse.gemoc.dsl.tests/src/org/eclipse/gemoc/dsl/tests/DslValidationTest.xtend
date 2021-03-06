/*
 * generated by Xtext 2.12.0
 */
package org.eclipse.gemoc.dsl.tests

import com.google.inject.Inject
import org.eclipse.gemoc.dsl.Dsl
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.Test
import org.junit.runner.RunWith

import static extension org.junit.Assert.*
import org.eclipse.gemoc.tests.DslInjectorProvider
import org.eclipse.xtext.testing.validation.ValidationTestHelper
import org.eclipse.gemoc.dsl.DslPackage
import org.eclipse.gemoc.validation.DslValidator

@RunWith(XtextRunner)
@InjectWith(DslInjectorProvider)
class DslValidationTest {
	@Inject
	ParseHelper<Dsl> parseHelper
	
	@Inject extension	ValidationTestHelper
	
	@Test
	def void missingName() {
		val result = parseHelper.parse('''
			noname = my.language
		''')
		
		assertNotNull(result)
		result.assertError(DslPackage::eINSTANCE.dsl, DslValidator::MISSING_NAME,'Missing an entry "name"')
	}
	
	@Test
	def void duplicateEntryKey() {
		val result = parseHelper.parse('''
			noname = my.language1
			anotherkey = foo
			noname = my.language2
		''')
		
		assertNotNull(result)
		result.entries.get(0).assertError(DslPackage::eINSTANCE.entry, DslValidator::DUPLICATEKEY,'Duplicate key "noname"')
		result.entries.get(2).assertError(DslPackage::eINSTANCE.entry, DslValidator::DUPLICATEKEY,'Duplicate key "noname"')
	}

}
