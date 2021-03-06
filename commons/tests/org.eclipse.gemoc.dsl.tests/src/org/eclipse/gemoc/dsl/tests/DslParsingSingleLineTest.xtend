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

@RunWith(XtextRunner)
@InjectWith(DslInjectorProvider)
class DslParsingSingleLineTest {
	@Inject
	ParseHelper<Dsl> parseHelper

	@Test
	def void minimal_no_quote() {
		val result = parseHelper.parse('''
			name = my.language
		''')
		assertNotNull(result)
		assertTrue(
			"eResource.errors not Empty " + result.eResource.errors,
			result.eResource.errors.isEmpty
		)
		assertEquals("my.language", result.name)
		
	}

	@Test
	def void minimal_key_value() {
		val result = parseHelper.parse('''
			name = my.language
			mykey = myvalue
		''')
		assertNotNull(result)
		assertTrue(
			"eResource.errors not Empty " + result.eResource.errors,
			result.eResource.errors.isEmpty
		)
		assertEquals("my.language", result.name)
		assertTrue("no key named \"mykey\"", result.entries.exists[e|e.key == "mykey"])
		assertEquals("myvalue", result.entries.findFirst[e|e.key == "mykey"].value)
	}

	@Test
	def void minimal_key_value_and_comment() {
		val result = parseHelper.parse('''
			# some comment
			name = my.language
			# some more comment
			mykey = myvalue
			# again some more comment
		''')
		assertNotNull(result)
		assertTrue(
			"eResource.errors not Empty " + result.eResource.errors,
			result.eResource.errors.isEmpty
		)
		assertEquals("my.language", result.name)
		assertTrue("no key named \"mykey\"", result.entries.exists[e|e.key == "mykey"])
		assertEquals("myvalue", result.entries.findFirst[e|e.key == "mykey"].value)
	}

	@Test
	def void minimal_name_keyword_in_value_01() {
		val result = parseHelper.parse('''
			name = my.language
			mykey = "name"
		''')
		assertNotNull(result)
		assertTrue(
			"eResource.errors not Empty " + result.eResource.errors,
			result.eResource.errors.isEmpty
		)
		assertEquals("my.language", result.name)
		assertTrue("no key named \"mykey\"", result.entries.exists[e|e.key == "mykey"])
		assertEquals("\"name\"", result.entries.findFirst[e|e.key == "mykey"].value)
	}

	@Test
	def void minimal_name_keyword_in_value_02() {
		val result = parseHelper.parse('''
			name = my.language
			mykey = myval_with_name_in_val
		''')
		assertNotNull(result)
		assertTrue(
			"eResource.errors not Empty " + result.eResource.errors,
			result.eResource.errors.isEmpty
		)
		assertEquals("my.language", result.name)
		assertTrue("no key named \"mykey\"", result.entries.exists[e|e.key == "mykey"])
		assertEquals("myval_with_name_in_val", result.entries.findFirst[e|e.key == "mykey"].value)
	}

	@Test
	def void minimal_na_keyword_in_value() {
		val result = parseHelper.parse('''
			name = my.language
			mykey = final
		''')
		assertNotNull(result)
		assertTrue(
			"eResource.errors not Empty " + result.eResource.errors,
			result.eResource.errors.isEmpty
		)
		assertEquals("my.language", result.name)
		assertTrue("no key named \"mykey\"", result.entries.exists[e|e.key == "mykey"])
		assertEquals("final", result.entries.findFirst[e|e.key == "mykey"].value)
	}
	
	@Test
	def void minimal_equal_sign_in_value() {
		val result = parseHelper.parse('''
			name = my.language
			mykey = "bla=bli"
		''')
		assertNotNull(result)
		assertTrue(
			"eResource.errors not Empty " + result.eResource.errors,
			result.eResource.errors.isEmpty
		)
		assertEquals("my.language", result.name)
		assertTrue("no key named \"mykey\"", result.entries.exists[e|e.key == "mykey"])
		assertEquals("\"bla=bli\"", result.entries.findFirst[e|e.key == "mykey"].value)
	}
	
	@Test
	def void complex_values() {
		val result = parseHelper.parse('''
			name = my.language
			mykey1 = "blabli";"3.0.1", "foobar" ; "4.0.7"
		''')
		assertNotNull(result)
		assertTrue(
			"eResource.errors not Empty " + result.eResource.errors,
			result.eResource.errors.isEmpty
		)
		assertEquals("my.language", result.name)
		assertTrue("no key named \"mykey1\"", result.entries.exists[e|e.key == "mykey1"])
		assertEquals("\"blabli\";\"3.0.1\", \"foobar\" ; \"4.0.7\"", result.entries.findFirst[e|e.key == "mykey1"].value)
	}
	
	@Test
	def void complex_values_and_special_char() {
		val result = parseHelper.parse('''
			name = my.language
			mykey1 = "blabli";"3.0.1", "foobar" ; ["4.0.7"..[
		''')
		assertNotNull(result)
		assertTrue(
			"eResource.errors not Empty " + result.eResource.errors,
			result.eResource.errors.isEmpty
		)
		assertEquals("my.language", result.name)
		assertTrue("no key named \"mykey1\"", result.entries.exists[e|e.key == "mykey1"])
		assertEquals("\"blabli\";\"3.0.1\", \"foobar\" ; [\"4.0.7\"..[", result.entries.findFirst[e|e.key == "mykey1"].value)
	}
	

}
