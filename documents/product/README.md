# WeLoveParty

See the chinese version of it [here](README_cn.md).

> If you know how to use google translate to translate the whole web page, you can understand those chinese words.

## name
WeLoveParty

## needs
1. User can login by using their email address
2. User can change their profile
3. User can create a chat room, join a chat room
4. Make sure the room creator is always at the top
5. Friend List feture, I mean, one user can add another as one of his/her friends.
6. Chat Page, where user can do text/audio/video chat with his/her friend.

## future needs
1. User can open video room, join video room
2. Support blockchain wallet, so that user can transfering money between each other, for example, send to the room creator

## user interface design
### 3 tabs
* audio chat room list page | 参考 网易云聊天房 + twitter 语音室
* public service location search page (for free stuff, allow users to give scores and change labels(whether 24hours open, have free WiFi or not, have place to shit or not, have free drink or not)) | 评分参考豆瓣，基础设施信息 icons 参考 飞猪酒店/高德酒店
* `Friend_List and Chat_List` Page
* More feature entry page (have seting entry here) | 参考 `TIM 我的` page
    * Find Users that you might be interested in by looking at photos. (like or not like. We could use finger movement to do this. Move right means like, move left means not like). You can reference Tantan or Tinder.

### party_room tab
...

### free_map tab
We want to make it as simple as possible. 

So we'll only use “latitude(y) and longitude(x)”.

Where user is located, where has (x,y). GPS will tell you the information.

And all those target position has their own (x,y,z) location information.

What we have to do is to draw a picture where user is in the center, some targets are inside of a range, let's say, inside of a circle.

Anyway, it's similar to `radar graph` in `seven dragon ball`(an animation: https://dragonball.fandom.com/wiki/Dragon_Radar)

The distance is changeable by finger gesture (two finger zoom up or zoom out).

> It can also be: where user click, where is the center (x,y)

### friend_list tab
We have a friend_list, for each item, it got:

```json
{
    nickname: 'girlfriend1',
    name: 'princess',
    email: '*@*.com'
}
```

For this list, we'll use `lazy loading` technology, which means we load more items only when we doing the scrolling.

When we click one friend item, we'll get into a chat page, where we could chat with our friend.

If we recently had a conversation with one friend, this friend will be on the top.

At the top bar, on the right, we'll have a search icon and add icon. 

    * The search icon will allow us to do a global search to filter out those conversations or contacts that do not include those keywords we input.
    * The add icon will allow us to add a new friend from the information we input

> At the top bar, we could also add another tab called `New People`, which would contain a list of conversations that were initiated by unknown people from somewhere. You can choose to add them as your friend. (If you choose to talk, they'll be on the top without get deleted by cache rule.)