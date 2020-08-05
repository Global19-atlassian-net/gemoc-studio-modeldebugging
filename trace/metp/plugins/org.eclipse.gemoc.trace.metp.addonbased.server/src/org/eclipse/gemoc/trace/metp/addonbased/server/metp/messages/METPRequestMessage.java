/*******************************************************************************
 * Copyright (c) 2020 Inria and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Inria - initial API and implementation
 *******************************************************************************/
package org.eclipse.gemoc.trace.metp.addonbased.server.metp.messages;

import org.eclipse.lsp4j.jsonrpc.messages.RequestMessage;

/**
 * METP specific version of RequestMessage.
 *
 * @see DebugMessageTypeAdapter
 */
public class METPRequestMessage extends RequestMessage {
	// no additional fields are needed to represent request messages in METP
}