'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "216ccb23bbcdd074338293bc4438739e",
"index.html": "644e49ddff4bc25161197aa523c0f023",
"/": "644e49ddff4bc25161197aa523c0f023",
"main.dart.js": "c8d2edd40f1f08c50330da58d82590b0",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "09738b0248dd5c2a5fde3ad6b8ed3fca",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "7913dae9ea22ef3634ba896c90eec885",
"manifest.json": "c353fd358569b36d7be22b8d67e99e78",
"assets/AssetManifest.json": "6ac86ca0347c1b2a4b727956bb45115c",
"assets/NOTICES": "239f6795830ac20edc67f151d8a0987b",
"assets/FontManifest.json": "717bed709c3030fd4979112d840a68cd",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "e9f2f143310604845f8aa26c42ad5f55",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/rflutter_alert/assets/images/icon_success.png": "8bb472ce3c765f567aa3f28915c1a8f4",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_success.png": "7d6abdd1b85e78df76b2837996749a43",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_error.png": "2da9704815c606109493d8af19999a65",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_warning.png": "e4606e6910d7c48132912eb818e3a55f",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_info.png": "612ea65413e042e3df408a8548cefe71",
"assets/packages/rflutter_alert/assets/images/2.0x/close.png": "abaa692ee4fa94f76ad099a7a437bd4f",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_success.png": "1c04416085cc343b99d1544a723c7e62",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_error.png": "15ca57e31f94cadd75d8e2b2098239bd",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_warning.png": "e5f369189faa13e7586459afbe4ffab9",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_info.png": "e68e8527c1eb78949351a6582469fe55",
"assets/packages/rflutter_alert/assets/images/3.0x/close.png": "98d2de9ca72dc92b1c9a2835a7464a8c",
"assets/packages/rflutter_alert/assets/images/icon_error.png": "f2b71a724964b51ac26239413e73f787",
"assets/packages/rflutter_alert/assets/images/icon_warning.png": "ccfc1396d29de3ac730da38a8ab20098",
"assets/packages/rflutter_alert/assets/images/icon_info.png": "3f71f68cae4d420cecbf996f37b0763c",
"assets/packages/rflutter_alert/assets/images/close.png": "13c168d8841fcaba94ee91e8adc3617f",
"assets/packages/im_stepper/assets/me.jpg": "487511e754834bdf2e6771376d59707e",
"assets/shaders/ink_sparkle.frag": "9e020b7dc809a00ca01a2e5d6fcc66fb",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/images/gigFastInternet.png": "b73458bddd9b16b90078753eff25bb51",
"assets/assets/images/blue_bg_image.jpg": "2ac63345908b3b6d83b21c333b8df16b",
"assets/assets/images/fees.png": "85c6e427e4b7baf64859526b2851bf0d",
"assets/assets/images/icon_gigFastTV.png": "7e80ebec3f6abb5850285ff16e4b8055",
"assets/assets/images/swipes.png": "a46565f1d25162a21fc561721455cab4",
"assets/assets/images/location_pin.png": "568522affcafff896fc29515476b025e",
"assets/assets/images/tvicon.png": "7e80ebec3f6abb5850285ff16e4b8055",
"assets/assets/images/location_pin_mini.png": "7a42879d3d869b88a8be06a1c3d1209c",
"assets/assets/images/instagram.png": "5a28e34e9f5b0a3675fd33b12200c35d",
"assets/assets/images/blue_circles.png": "e45039d53b3536b927fc2e4af8775083",
"assets/assets/images/referral.png": "debd4888774e9e555d86505396c25fe4",
"assets/assets/images/bg_image.png": "b150b16d7b702057c684b9a6fa475d8a",
"assets/assets/images/gigFastVoice.png": "a3f77afe20fae41a4280a3d7bee92f85",
"assets/assets/images/pointer.png": "568522affcafff896fc29515476b025e",
"assets/assets/images/loading.gif": "7774d51fc737ace7f8fb6a35684bfa74",
"assets/assets/images/new_service_request.png": "10abe1fb238a7406b79b8c2d59d0496a",
"assets/assets/images/icon_gigFastVoice.png": "090de74b904e52f118bab810ac4ade03",
"assets/assets/images/lanscape.jpg": "2e99fbf18fa78227ff0f3c5532480a48",
"assets/assets/images/gigFastTV.png": "b70f875e6e82f57fd7aac7ee98926982",
"assets/assets/images/ATA.png": "ccef139169d23c424271f544c6ac6c84",
"assets/assets/images/twitter.png": "400dc88500c0bc5e11f6c953dedcc7ab",
"assets/assets/images/starzlogo.jpeg": "63a2a4146730dc5016efb921487d2f31",
"assets/assets/images/bouncy_down.gif": "ba83008f6168d2cb3bf5c692cc7f693d",
"assets/assets/images/phone.png": "b74034de2116b9542ea0291a6f297329",
"assets/assets/images/router.png": "b03b839e6e31cdc5b41835978387d8d5",
"assets/assets/images/youtube.png": "b0dbc67fd7b037e10ae99b8c68dbaa9f",
"assets/assets/images/sideCircles.png": "6f464533d0828361745cce74b60de084",
"assets/assets/images/success.riv": "b7a0e4b984e5c2f5ea5e5b07a1865080",
"assets/assets/images/google.png": "02e7940cbff63de74bb261800a859dce",
"assets/assets/images/voice.png": "122d246597bba0d1ad732310d443718b",
"assets/assets/images/facebook.png": "fe57c5ef69a566e3a9b18b7c298fa534",
"assets/assets/images/icon_gigFastInternet.png": "28388129133f1ba2b374f83ce0e6101d",
"assets/assets/images/tv_popup_bg.png": "e918a2520440e9113a27f6a8cec6134e",
"assets/assets/images/voice1.png": "b595967b08f53b78d9d3e59f3ca6ae55",
"assets/assets/images/rtastb.png": "9c4daaedb4886529a0bddf68d56b6c03",
"assets/assets/images/rta_logo.png": "c9cd0e20d12d5cde57955f6f0363ed7a",
"assets/assets/logos/fxm.png": "fc8922b439460c6a217efdb5135da517",
"assets/assets/logos/starz.png": "de5bf7820dc06419b3e6e9de4c2afadb",
"assets/assets/logos/hbo.png": "4fa09001fda396151ff9914382e1b4f6",
"assets/assets/logos/cinemax.png": "8bc210e6ccf2a1775d88d5e0a0f0b99e",
"assets/assets/logos/boom.png": "5ebf95430682dca793421bd096e89340",
"assets/assets/logos/showtime.png": "90cfacdaebcb29f74b302aa2d29f7a21",
"assets/assets/logos/espn.png": "35aafe43301379f4b1c3de43ba8e6a75",
"assets/assets/MyFlutterApp.ttf": "219268b18ca149122fd6229e1a92e328",
"assets/assets/documents/RTAPhoneLOA.pdf": "5724bdfd0569921273ff24730a5c4267",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
