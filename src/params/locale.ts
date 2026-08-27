import type { ParamMatcher } from '@sveltejs/kit'
import { LOCALE_PREFIXES } from '$lib/i18n/registry'

/**
 * Gates the `[[lang]]` segment every page route sits under, so only a real
 * locale can claim one. Without it `/download` would match as lang=download and
 * every page on the site would become a 404 in a language nobody speaks.
 */
export const match: ParamMatcher = param => LOCALE_PREFIXES.includes(param)
