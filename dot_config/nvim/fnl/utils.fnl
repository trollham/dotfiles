(fn str? [x]
  (= :string (type x)))

(fn ->str [x]
  (tostring x))

(fn nil? [x]
  (= nil x))

(fn includes? [xs x]
  (accumulate [is? false _ v (ipairs xs) :until is?]
    (= v x)))

(fn tbl? [x]
  (= :table (type x)))

(fn head [xs]
  (. xs 1))

{: str?
 : ->str
 : nil?
 : tbl?
 : includes?
 : head}
