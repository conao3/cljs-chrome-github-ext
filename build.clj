(ns build
  (:require
   [clojure.tools.build.api :as b]))

(def class-dir "target/classes")
(def ext-dir "target/extension")

(defn clean [_]
  (b/delete {:path "target"})
  (b/delete {:path "resources-dev/public/dist"})
  (b/delete {:path "resources/public/dist"})
  (b/delete {:path ".shadow-cljs"}))

(defn compile-cljs [_]
  (b/process {:command-args ["pnpm" "exec" "shadow-cljs" "compile" "app"]}))

(defn release-cljs [_]
  (b/process {:command-args ["pnpm" "exec" "shadow-cljs" "release" "app"]}))

(defn package [_]
  (b/copy-dir {:src-dirs ["resources/public"]
               :target-dir ext-dir})
  (b/zip {:src-dirs [ext-dir]
          :zip-file "target/extension.zip"}))

(defn release [_]
  (clean nil)
  (release-cljs nil)
  (package nil))
