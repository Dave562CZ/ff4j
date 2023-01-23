package org.ff4j.web.thymeleaf;

/*-
 * #%L
 * ff4j-web
 * %%
 * Copyright (C) 2013 - 2023 FF4J
 * %%
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * #L%
 */

import org.thymeleaf.dialect.AbstractDialect;
/**
 * Created by benoitmeriaux on 08/01/15.
 */
public class FF4JDialect extends AbstractDialect {

    public FF4JDialect(String name) {
        super(name);
    }
}
