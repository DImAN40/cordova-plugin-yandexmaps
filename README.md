<!---
	license: Licensed to the Apache Software Foundation (ASF) under one
	or more contributor license agreements.  See the NOTICE file
	distributed with this work for additional information
	regarding copyright ownership.  The ASF licenses this file
	to you under the Apache License, Version 2.0 (the
	"License"); you may not use this file except in compliance
	with the License.  You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing,
	software distributed under the License is distributed on an
	"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
	KIND, either express or implied.  See the License for the
	specific language governing permissions and limitations
	under the License.
-->

# Cordova yandex maps plugin

Opens yandex maps application with a path from A to B:
   Yandexmaps.open(latFrom, lonFrom, latTo, lonTo);
   
For ios:
1. Plugin tries to open yandex maps app
2. If there are no yandex maps app plugin tries to open yandex navigator app
3. If there are no yandex navigator app plugin tries to open apple maps app

For android:
1. Plugin tries to open yandex maps app
2. If there are no yandex maps app plugin tries to open yandex navigator app
3. If there are no yandex navigator app plugin tries to open google maps app