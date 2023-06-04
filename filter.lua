function BulletList(elem)
  local l = elem.content[1][2]
  if l and l.tag == 'BulletList' and l.content[1][1].content[1].text == ':' then
    return pandoc.DefinitionList(elem.content:map(
      function (item)
        item[1] = item[1]:walk {
          Code = function(elem)
            return pandoc.Strong(elem.text)
          end
        }.content
        item[2] = item[2].content:map(
          function (blocks)
            -- remove : and space
            blocks[1].content:remove(1)
            blocks[1].content:remove(1)
            return blocks
          end
        )
        return item
      end
    ))
  end
  return elem
end

function Header(elem)
  if elem.level == 1 then
    return elem:walk {
      Str = function(elem)
        return string.upper(elem.text)
      end
    }
  end
  return elem
end

function Meta(meta)
  local format = "(%d+)-(%d+)-(%d+)"
  local y, m, d = pandoc.utils.stringify(meta.date):match(format)
  local date = os.time({ year = y, month = m, day = d })
  meta.date = pandoc.Str(os.date("%B %d, %Y", date):gsub(" 0", " "))
  return meta
end
